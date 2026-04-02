# Lifecraft Studios — Parent Company Planning

This project acts as the "Umbrella" repository for all Lifecraft Studios ventures. It houses business planning, legal research, and internal documentation.

## Beads Infrastructure (Remote Dolt)

Lifecraft uses **Beads** (`bd` CLI) for structured task tracking. To enable cross-device collaboration between the husband-and-wife team, the database is hosted remotely on **HomePilot (TrueNAS)**.

### **Connection Settings**
- **Host:** `192.168.1.86` (truenas.local)
- **Port:** `30216`
- **Database:** `Lifecraft`
- **User:** `root`

### **Configuration**
The connection is managed via `.beads/metadata.json` and `.beads/config.yaml`. 

**CRITICAL:** To interact with the beads, you must provide the Dolt password. You can set this in your environment to avoid prompts:
```bash
export BEADS_DOLT_PASSWORD=lifecraft_beads
```

### **Common Commands**
- `bd list --all` — View the full planning roadmap.
- `bd ready` — See tasks ready for immediate action.
- `bd show <ID>` — See research and notes for a specific task (e.g., `bd show Lifecraft-dkk.10`).
- `./sync-beads.sh` — Sync the latest remote beads into the Docusaurus JSON data for the dashboard.

## Internal Documentation

The internal documentation is built with **Docusaurus** and served via HomePilot.

- **Source:** `/internal-docs`
- **Live URL:** `http://truenas.local:30215`
- **Dashboard:** `http://truenas.local:30215/beads`

### **Deployment Pipeline**
1. Make changes in `internal-docs/`.
2. Commit and push to GitHub (`n7njo/Lifecraft-docs`).
3. Run deployment from the `HomePilot` directory:
   ```bash
   homepilot deploy lifecraft-docs
   ```

## Key Business Epics
1. **Lifecraft-dkk:** Company Registration & Structure
2. **Lifecraft-dbi:** Legal & Liability Framework
3. **Lifecraft-lvy:** Tax Strategy & Compliance
4. **Lifecraft-ok1:** Banking & Finance Setup
5. **Lifecraft-b68:** Spouse & Career Dynamics
6. **Lifecraft-i9y:** Umbrella Product Architecture
