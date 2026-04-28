# Setup Instructions

This portfolio was generated at `D:\GitHub\Claude_Management\cybersecurity-portfolio`. Move it to `D:\GitHub\cybersecurity-portfolio` if you want it at the originally requested path, then run the steps below from PowerShell.

## 1. Move the folder (optional)

```powershell
Move-Item D:\GitHub\Claude_Management\cybersecurity-portfolio D:\GitHub\cybersecurity-portfolio
cd D:\GitHub\cybersecurity-portfolio
```

If you keep it at the current path, just `cd` into it.

## 2. Initialise the repository

```powershell
cd D:\GitHub\cybersecurity-portfolio
git init -b main
git add .
git commit -m "Initial commit: cybersecurity portfolio scaffolded from Quartz"
```

## 3. Create the GitHub repository and push

Create a new empty repository on GitHub named `cybersecurity-portfolio` (no README, no licence, no .gitignore from the GitHub side). Then:

```powershell
git remote add origin https://github.com/<your-github-username>/cybersecurity-portfolio.git
git push -u origin main
```

## 4. Enable GitHub Pages

1. Go to the repo on GitHub
2. Settings, then Pages
3. Set Source to "GitHub Actions"
4. Update `baseUrl` in `quartz.config.ts` to your real Pages URL, for example `<your-username>.github.io/cybersecurity-portfolio`
5. Commit and push the change

The workflow at `.github/workflows/deploy.yml` runs on every push to `main` and deploys the built site to GitHub Pages.

## 5. Local preview

```powershell
npm ci
npx quartz build --serve
```

Site available at http://localhost:8080.
