#!/usr/bin/env python3
"""Preview retention moves; --apply copies, verifies SHA-256, then unlinks originals."""
import argparse
import hashlib
import json
import re
import shutil
from datetime import date, datetime, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ARCHIVE = Path('/Users/shriram/Library/CloudStorage/OneDrive-UniversityofIllinois-Urbana/project-files/molecular-genetics-notes')
NUMBER = re.compile(r'^(?:problems-day-|problem set |set )(\d+)$')

def digest(p):
    h = hashlib.sha256()
    with p.open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

def plan(today):
    cutoff = today - timedelta(days=6)
    numbered = [int(m[1]) for p in (ROOT / 'problem-sets').glob('*.pdf') if (m := NUMBER.match(p.stem))]
    retained = sorted(set(numbered))[-7:]
    moves = {}
    for p in sorted(ROOT.rglob('*.pdf')):
        rel = p.relative_to(ROOT)
        if p.is_symlink() or '.git' in rel.parts:
            continue
        m = NUMBER.match(p.stem) if rel.parts[0] == 'problem-sets' else None
        dates = re.findall(r'\d{4}-\d{2}-\d{2}', p.stem)
        observed = date.fromisoformat(dates[-1]) if dates else datetime.fromtimestamp(p.stat().st_mtime).date()
        reference = rel.parts[0] in ('textbooks', 'reference') or str(rel).startswith('course/reference/') or str(rel) == 'misc/jkae299.pdf'
        reason = ('reference PDF' if reference else 'older numbered sheet' if m and int(m[1]) not in retained else 'older than seven calendar dates' if not m and observed < cutoff else None)
        if reason:
            moves[rel] = reason
    return retained, cutoff, moves

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--apply', action='store_true')
    args = parser.parse_args()
    retained, cutoff, moves = plan(date.today())
    records = []
    for rel, reason in sorted(moves.items()):
        source, target = ROOT / rel, ARCHIVE / rel
        record = dict(path=str(rel), bytes=source.stat().st_size, sha256=digest(source), reason=reason)
        if target.exists() and (not target.is_file() or digest(target) != record['sha256']):
            raise RuntimeError(f'Archive collision; no moves started: {target}')
        records.append(record)
    report = dict(date=str(date.today()), archive=str(ARCHIVE), retained_sets=retained, earliest_retained_date=str(cutoff), files=records)
    print(json.dumps(dict(report, files=len(records), bytes=sum(r['bytes'] for r in records)), indent=2))
    if not args.apply:
        for r in records:
            print(f"{r['reason']}: {r['path']}")
        return
    # Copy and verify the whole batch before removing any originals.
    for r in records:
        src, dst = ROOT / r['path'], ARCHIVE / r['path']
        dst.parent.mkdir(parents=True, exist_ok=True)
        if not dst.exists():
            with src.open('rb') as incoming, dst.open('xb') as outgoing:
                shutil.copyfileobj(incoming, outgoing)
            shutil.copystat(src, dst)
        if digest(dst) != r['sha256'] or digest(src) != r['sha256']:
            raise RuntimeError(f'Integrity check failed: {src}')
    stamp = datetime.now().strftime('%Y%m%d-%H%M%S-%f')
    manifest = ROOT / 'course/archive-manifests' / (stamp + '.json')
    manifest.parent.mkdir(parents=True, exist_ok=True)
    manifest.write_text(json.dumps(report, indent=2) + '\n')
    archive_manifest = ARCHIVE / manifest.relative_to(ROOT)
    archive_manifest.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(manifest, archive_manifest)
    for r in records:
        src, dst = ROOT / r['path'], ARCHIVE / r['path']
        if digest(src) != r['sha256'] or digest(dst) != r['sha256']:
            raise RuntimeError(f'File changed before removal: {src}')
        src.unlink()
    print(f'Archived and verified {len(records)} files. Manifest: {manifest}')

if __name__ == '__main__':
    main()
