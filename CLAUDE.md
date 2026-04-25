# Lifecraft — Openshaw Project Services Planning Repo

This is the umbrella planning repository for **Openshaw Project Services Ltd.** (legal name), a BC-incorporated holding company. It houses business formation documents, legal research, governance records, and the internal Docusaurus site.

## Project Structure

```
internal-docs/          Docusaurus site (source for truenas.local:30215)
  docs/governance/      Legal corporate records (Articles, SHA, Registers, etc.)
  docs/business-epics/  Epic summaries
  docs/collaboration/   Spouse/partner working agreements
.beads/                 Beads issue tracker config and JSONL backup
beads-api-config.yaml   HomePilot config for the beads-api container
sync-beads.sh           Syncs remote Dolt → Docusaurus JSON data for the dashboard
```

## Beads Issue Tracker

All task tracking uses **bd (beads)**. Do not use markdown TODOs or other trackers.

### Connection

The Dolt database is hosted remotely on TrueNAS. Set the password before running any `bd` command:

```bash
export BEADS_DOLT_PASSWORD=lifecraft_beads
```

Connection: `root@192.168.1.86:30216` → database `Lifecraft`

### Key Commands

```bash
bd ready                        # Show unblocked work
bd list --status=open           # All open issues
bd show <id>                    # Full issue detail with notes and deps
bd update <id> --claim          # Claim an issue before starting
bd close <id>                   # Mark complete
bd stats                        # Counts by status
```

Issue IDs follow the pattern `Lifecraft-<prefix>.<n>` (e.g. `Lifecraft-dkk.3`).

### Epic Map

| ID prefix | Epic |
|-----------|------|
| dkk | Company Registration & Structure |
| dbi | Legal & Liability Framework |
| lvy | Tax Strategy & Compliance |
| ok1 | Banking & Finance Setup |
| b68 | Spouse & Career Dynamics |
| i9y | Umbrella Product Architecture |
| 7cc | Internal Documentation & Knowledge Base |
| yjv | Brand Transition to Openshaw Project Services |

## Internal Docs (Docusaurus)

Source lives in `internal-docs/`. Served at `http://truenas.local:30215`.

**Deploy pipeline:**
1. Edit files in `internal-docs/`
2. Commit and push to GitHub (`n7njo/Lifecraft-docs` — this is a submodule)
3. `homepilot deploy lifecraft-docs` from the HomePilot directory

**Governance docs** are in `internal-docs/docs/governance/`. Each page has a "Professional PDF" export button for physical minute books. Do not delete or rename these files without updating the Docusaurus sidebar.

## Key Facts

- **Legal entity:** Openshaw Project Services Ltd. (BC incorporation in progress)
- **Brand name:** Openshaw Project Services (public-facing)
- **Registered office:** 25518 Bosonworth Ave, Maple Ridge, BC V2W 1G9
- **Ownership:** 50/50 spousal partnership (Neil + spouse)
- **EIN:** Pending IRS call once Certificate of Incorporation received (use Form SS-4, call +1 267-941-1099)
- **Shareholders' Agreement draft:** `internal-docs/docs/governance/shareholders-agreement.md`

## Non-Interactive Shell Commands

Shell aliases on this system may add `-i` flags to `cp`, `mv`, `rm`. Always use explicit flags:

```bash
cp -f src dst     # not: cp src dst
mv -f src dst     # not: mv src dst
rm -f file        # not: rm file
rm -rf dir
```

## Session Close Protocol

Work is not done until pushed. Before ending any session:

```bash
git add <files>
git commit -m "..."
git pull --rebase
bd sync
git push
# Verify: git status shows "up to date with origin"
```
