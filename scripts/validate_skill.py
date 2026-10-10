#!/usr/bin/env python3
"""Validator struktur skill — stdlib only, dijalankan CI. (ADR-001)"""
import re, sys, pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
errors = []

skill = ROOT / "SKILL.md"
if not skill.is_file():
    errors.append("SKILL.md tidak ada")
    print("\n".join(errors) or "OK")
    sys.exit(1)

text = skill.read_text(encoding="utf-8")
m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
if not m:
    errors.append("frontmatter YAML tidak ditemukan di SKILL.md")
else:
    fm = m.group(1)
    name = re.search(r"^name:\s*(.+)$", fm, re.M)
    desc = re.search(r'^description:\s*"?(.*?)"?\s*$', fm, re.M)
    if not name:
        errors.append("frontmatter: name hilang")
    elif name.group(1).strip() != "scientific-research":
        errors.append(f"name harus 'scientific-research', dapat '{name.group(1).strip()}'")
    if not desc:
        errors.append("frontmatter: description hilang")
    elif len(desc.group(1).strip()) > 60:
        errors.append(f"description {len(desc.group(1).strip())} karakter (>60)")

refs = sorted(set(re.findall(r"(?:references|assets)/[A-Za-z0-9_./-]+\.(?:md|bib)", text)))
if not refs:
    errors.append("tidak ada rujukan references/ atau assets/ di SKILL.md")
for r in refs:
    if not (ROOT / r).is_file():
        errors.append(f"file dirujuk tidak ada: {r}")

n_ref = len(list((ROOT / "references").glob("*.md"))) if (ROOT / "references").is_dir() else 0
if n_ref < 8:
    errors.append(f"references/ berisi {n_ref} file (<8)")

if errors:
    print("VALIDASI GAGAL:")
    print("\n".join(f"- {e}" for e in errors))
    sys.exit(1)
print(f"OK: name valid, description <=60 char, {len(refs)} rujukan ada, {n_ref} file fase.")
