# Agent Context & Guidelines for tallsong.github.io

## 1. Overview & Positioning
- **Owner**: Cedar (Gaosong Chen) — Software Engineer based in Berlin, Germany.
- **Site Nature**: A modern, comfortable, and warm personal space accessible to anyone (including non-tech friends and offline acquaintances), while housing rigorous technical projects and resume materials for engineering peers and recruiters.
- **Tech Stack**: Jekyll (AcademicPages base), GitHub Pages, SCSS, Markdown.

---

## 2. Core Philosophy & Design Goals
1. **Comfortable & Human-First**:
   - Anyone opening the website should feel like they are visiting a welcoming personal space, not reading an impersonal corporate resume.
   - The homepage and personal essays should use clear, approachable language (no unnecessary jargon or AI buzzwords).
2. **Two-Track Content Architecture**:
   - **Track A (For Friends & Everyday Visitors)**: Personal reflections, language learning experiences, communication insights, and life in Berlin (`_pages/about.md` and `_posts/`).
   - **Track B (For Recruiters & Tech Peers)**: Deep engineering case studies, STAR-method project write-ups, and systems architecture (`_projects/` and CV).
3. **Modern & Polished Aesthetics**:
   - Use soft cards, comfortable spacing, rounded corners (`border-radius: 14px-16px`), subtle borders, gentle shadows, and interactive pills.
   - Maintain the live status indicator (`.status-badge`) and conversation starters (`.topic-pill`).

---

## 3. Content & Writing Guidelines for the Agent
- **Tone**: Authentic, thoughtful, humble, and friendly. Avoid robotic "AI-generated" phrasing.
- **Homepage (`_pages/about.md`)**:
  - Keep it warm and concise. Update the "What I'm Doing Now" section periodically with real-life hobbies and thoughts.
  - Highlight conversation starters (topics to chat about over coffee).
- **Personal Essays (`_posts/`)**:
  - Focus on honest reflections (e.g. language journey, intercultural communication, thinking habits).
  - Use clear, vivid storytelling with actionable takeaways.
- **Technical Case Studies (`_projects/`)**:
  - Structure using the **STAR method** (Situation, Task, Action, Result).
  - Include architecture diagrams (Mermaid.js), quantitative metrics (latency, throughput, cost reduction), and tech stacks.

---

## 4. Technical Constraints & Maintenance
- **Jekyll Front Matter**: Ensure valid YAML front matter (`title`, `date`, `permalink`, `tags`) on all Markdown files.
- **Custom Styling**: Global custom styles and components live in `_sass/_custom.scss` and are imported into `assets/css/main.scss`.
- **Navigation**: Controlled via `_data/navigation.yml` (keep it clean and limited to top-level sections: About, Stories & Thoughts, Projects, CV).