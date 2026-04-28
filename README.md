# Cybersecurity Portfolio

A professional cybersecurity portfolio site built on [Quartz v4](https://quartz.jzhao.xyz/). The site separates capability design (Projects) from technical execution (Writeups), and presents supporting artefacts as downloadable deliverables.

## Structure

```
content/
  index.md                                  Landing page
  projects/
    incident-response-program/index.md      Enterprise IR Program design
    cloud-security-plan/index.md            AWS cloud security architecture
  writeups/
    tryhackme/rtcc/index.md                 Red Team Capstone walkthrough
  attachments/
    projects/irp/                           IRP supporting visuals
    projects/cloud/                         Cloud architecture visuals
    writeups/rtcc/                          RTCC engagement screenshots
```

## Local development

Requirements: Node.js 22 or higher.

```
npm ci
npx quartz build --serve
```

The site will be available at http://localhost:8080.

## Deployment

The site is deployed to GitHub Pages via the workflow at `.github/workflows/deploy.yml`. Pushing to the `main` branch triggers a build and deploy to GitHub Pages.

To enable Pages on a fresh repository:

1. Push the repository to GitHub
2. In the repo settings, set Pages source to "GitHub Actions"
3. Update `baseUrl` in `quartz.config.ts` to match your Pages URL
4. Push to `main` to trigger the first deploy

## Disclosure

All organisations, contacts and entities referenced inside the artefacts are fictional, sanitised, or part of approved training environments. Documents are presented as capability pieces and are not intended to be deployed verbatim into a live organisation.

## Credits

Built on [Quartz v4](https://github.com/jackyzha0/quartz) by Jacky Zhao.
