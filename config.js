/* Public frontend configuration ONLY. Never put a secret/service_role key here. */
window.QUIZ_CONFIG = {
  supabaseUrl: '', // e.g. https://YOUR_PROJECT.supabase.co
  supabasePublishableKey: '', // publishable / anon public key, NOT secret key
  weeks: [
    { number: 9, title: 'NFTs and Digital Ownership', file: 'questions-week9.json', quizId: 'nfts-week9-fall2026', enabled: true },
    { number: 10, title: 'Regulation and Policy of Digital Assets', file: 'questions-week10.json', quizId: 'week10-fall2026', enabled: false },
    { number: 11, title: 'Blockchain Scaling and Design Trade-offs', file: 'questions-week11.json', quizId: 'week11-fall2026', enabled: false },
    { number: 12, title: 'The Future: Blockchain, AI and IoT', file: 'questions-week12.json', quizId: 'week12-fall2026', enabled: false }
  ],
  enrollmentUrl: 'https://www.unic.ac.cy/iff/education-and-training/free-courses-moocs/blockchain-and-digital-assets',
  // Optional: e.g. '2026-12-21T23:59:59+02:00'; set to null during testing
  expiresAt: null
};
