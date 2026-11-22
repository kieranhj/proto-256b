# proto-256b: start here

Prototypes for an Acorn Archimedes 256-byte demo (intro), in ARM assembler (vasm).

| | |
|---|---|
| GitHub | https://github.com/kieranhj/proto-256b (public) |
| Local path | D:\archie\mine\proto-256b (moved from OneDrive\Archie\Repos\proto-256b on 2026-11-22) |
| Branch | master (only branch) |
| Last commit | 2020-08-25: Remove files to ignore. (2 commits in total) |

## What's in here
- `proto-256b.asm`: the intro; `swis.h.asm`: SWI numbers.
- `make.bat`: the build; `bin\vasmarm_std_win32.exe`: bundled vasm.
- `build\`: output (ignored).

## Build and run
- `make`: runs `make.bat` (works, 2026-11-22): assembles `build\proto-256b.bin` (128 bytes) and copies
  it to `..\..\Arculator_V2.0_Windows\hostfs\256b,ff8` (the D:\archie junction into D:\tools\archie).
- Tools: only the bundled vasm.
- Run: in Arculator 2.0, run `256b` from the HostFS filer.

## Local changes
- Working tree clean; no stashes; no snapshot branches.

## Status and next steps
- Two commits, both 2020-08-25. No TODO or plan notes found.

## See also
- README.md (one line).
