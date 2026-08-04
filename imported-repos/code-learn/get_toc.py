import pypdf
import sys
import glob

for f in glob.glob("sources/*.pdf"):
    try:
        reader = pypdf.PdfReader(f)
        outlines = reader.outline
        print(f"\n--- {f} ---")
        if outlines:
            count = 0
            for item in outlines:
                if isinstance(item, pypdf.generic.Destination):
                    count += 1
            print(f"Total pages: {len(reader.pages)}, Top-level outline items: {count}")
        else:
            print(f"Total pages: {len(reader.pages)}, No outlines found.")
    except Exception as e:
        print(f"Error reading {f}: {e}")
