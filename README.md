# MOOC Study Challenge — Session 9: NFTs and Digital Ownership

A static GitHub Pages pilot with 42 reviewed-draft multiple-choice questions sourced from *Blockchain and Digital Assets MOOC, Fall 2026*, Session 9. Fifteen easy, fifteen intermediate, twelve difficult; a quiz of up to 10 or 25 is randomized from the selected pool (difficult-only has 12 questions). Mixed mode can use 25. Review every question and explanation before sharing with students.

## Project Status and Attribution

**MOOC Study Challenge — Independent Educational Pilot**

This project is an experimental, independently developed educational resource designed to help learners review and reinforce concepts covered in the Blockchain & Digital Assets MOOC.

It has been developed by [@katerinaramm1](https://x.com/katerinaramm1) with the assistance of ChatGPT.

The practice questions are based on educational material published by the University of Nicosia, Institute for the Future, including *Session 9: NFTs and Digital Ownership*, © University of Nicosia, licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/). The questions and explanations are independently prepared adaptations for educational practice; changes have been made to the source material in creating this quiz.

The quiz questions and explanations are **not official university assessments**. This project is not currently an official University of Nicosia product and does not imply institutional endorsement.

**Software licensing:** No open-source software license has been selected for this pilot. Licensing and future reuse permissions will be considered as the project develops. The absence of a software license does not override the CC BY 4.0 terms that apply to the underlying course material.

**Official MOOC information:** https://www.unic.ac.cy/iff/education-and-training/free-courses-moocs/blockchain-and-digital-assets

**Creative Commons license:** https://creativecommons.org/licenses/by/4.0/

**Source materials:** The original PDF slide deck is deliberately **not included** in this repository or distribution. Please refer to official course channels for the slides. Do not add course PDFs or third-party media to the repository without checking redistribution rights.

**Before publication:** Check applicable university policies and contractual intellectual-property terms, and confirm whether the intended use of university branding or materials requires approval.

---

## Deploy
1. Upload `index.html`, `style.css`, `app.js`, `config.js`, `favicon.svg`, `questions-week9.json` to the root of a GitHub repository. **Do not upload the course PDF.** The repository contains the question bank, not the original slides.
2. In GitHub repository Settings → Pages, deploy from main branch root. Open the public Pages URL.
3. In `config.js`, set `expiresAt` only after testing. Browser-based expiration disables the quiz interface but does not protect publicly hosted files.
4. The official MOOC link is already configured for the homepage, footer and social-sharing text.

## Supabase leaderboard (optional)
The quiz works without a database. To enable a **friendly, unverified** public leaderboard:
1. Supabase project: turn on Data API and RLS. Keep automatic grants to new tables OFF.
2. In Supabase SQL Editor, run `supabase-schema.sql` after reviewing it. It creates `public.quiz_scores`, activates RLS and grants public read/insert access. There is no public update/delete policy.
3. Copy the *Project URL* and **publishable (or legacy anon) key** into `config.js`. NEVER expose a secret, service_role key, or database password.
4. Try submitting a sample score, then verify it in Supabase Table Editor.

### Important limitations
This pilot is entirely client-side. A technical user can inspect question answers and fake results submitted directly to the database. RLS can stop unauthorized actions but cannot certify truthful scores. The SQL restricts nicknames/score ranges and supports public scores, not verified scores. Do not use this leaderboard for grades or prizes. For anti-cheat, introduce a server-side question session / answer verification service, rate limits, CAPTCHA/Turnstile, and moderation. If spam occurs, disable public INSERT until those checks exist.

## Privacy / licensing
- Only voluntarily submitted nicknames, scores, difficulty, question count and submission dates are publicly stored. Do not submit full names or identifying personal data.
- The supplied slide deck is marked CC BY 4.0, University of Nicosia / Institute for the Future; retain attribution. This quiz is independent and not official course assessment.
- Confirm permission for external promotional use of the University's name and materials with the relevant course team.

## Add another week
1. Add a vetted `questions-week10.json` file matching the question format in Week 9.
2. In `config.js`, change the Week 10 entry from `enabled: false` to `enabled: true`. No homepage editing is required.
3. Each week uses its own `quizId` for leaderboard separation. If Supabase was configured using an older SQL schema, update its quiz ID constraint and RLS insert policy to allow the new week.
4. Week selection appears on the quiz setup and leaderboard. The entire site currently shares one optional expiration date. Week-specific closing dates can be added later.
