:root {
  --bg: #0a0e13;
  --panel: #10161d;
  --panel-alt: #131a22;
  --border: #232b34;
  --text: #d7dce1;
  --muted: #6b7684;
  --amber: #f0a868;
  --amber-dim: #8a6a45;
  --teal: #58d1c9;
  --teal-dim: #3d7d78;
  --danger: #d97757;
  --radius: 10px;
  --mono: 'JetBrains Mono', 'Fira Code', ui-monospace, monospace;
}

* { box-sizing: border-box; }

body {
  margin: 0;
  min-height: 100vh;
  background: var(--bg);
  background-image:
    radial-gradient(ellipse at top left, rgba(240, 168, 104, 0.06), transparent 45%),
    radial-gradient(ellipse at bottom right, rgba(88, 209, 201, 0.06), transparent 45%);
  color: var(--text);
  font-family: var(--mono);
  display: flex;
  align-items: flex-start;
  justify-content: center;
  padding: 32px 16px 64px;
}

.terminal {
  width: 100%;
  max-width: 760px;
  background: var(--panel);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  box-shadow: 0 30px 60px -20px rgba(0, 0, 0, 0.6);
  overflow: hidden;
}

.terminal__bar {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 16px;
  background: var(--panel-alt);
  border-bottom: 1px solid var(--border);
}

.terminal__dots { display: flex; gap: 7px; }
.dot { width: 10px; height: 10px; border-radius: 50%; opacity: 0.85; }
.dot--amber { background: var(--amber); }
.dot--teal { background: var(--teal); }
.dot--muted { background: var(--muted); }

.terminal__title {
  font-size: 12px;
  color: var(--muted);
  letter-spacing: 0.02em;
}

.terminal__body { padding: 28px 24px 20px; }

.prompt-line {
  font-size: 15px;
  margin: 0 0 6px;
  display: flex;
  flex-wrap: wrap;
  align-items: baseline;
  gap: 8px;
}

.prompt__user { color: var(--teal); font-weight: 600; }
.prompt__at { color: var(--muted); }
.prompt__host { color: var(--amber); font-weight: 600; }
.prompt__sep { color: var(--muted); margin-right: 2px; }
.prompt__cmd { color: var(--text); }

.cursor {
  display: inline-block;
  width: 8px;
  height: 16px;
  background: var(--amber);
  margin-left: 2px;
  vertical-align: -3px;
  animation: blink 1s steps(1) infinite;
}

@keyframes blink { 50% { opacity: 0; } }

.tagline {
  margin: 0 0 24px;
  font-size: 13px;
  color: var(--muted);
}

.filters {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 20px;
}

.filter {
  font-family: var(--mono);
  font-size: 12px;
  color: var(--muted);
  background: transparent;
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 6px 12px;
  cursor: pointer;
  transition: border-color 0.15s ease, color 0.15s ease;
}

.filter:hover { color: var(--text); border-color: var(--muted); }

.filter.is-active {
  color: var(--bg);
  background: var(--amber);
  border-color: var(--amber);
  font-weight: 600;
}

.shelf {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 8px;
}

.book {
  display: grid;
  grid-template-columns: auto 1fr auto auto;
  align-items: center;
  gap: 12px;
  padding: 12px 14px;
  background: var(--panel-alt);
  border: 1px solid var(--border);
  border-left: 3px solid var(--muted);
  border-radius: 6px;
  font-size: 13px;
  animation: appear 0.2s ease;
}

@keyframes appear {
  from { opacity: 0; transform: translateY(-4px); }
  to { opacity: 1; transform: translateY(0); }
}

.book[data-status="lendo"] { border-left-color: var(--amber); }
.book[data-status="lido"] { border-left-color: var(--teal); }
.book[data-status="quero-ler"] { border-left-color: var(--muted); }

.book__tag {
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.03em;
  padding: 2px 6px;
  border-radius: 4px;
  white-space: nowrap;
}

.book[data-status="lendo"] .book__tag { color: var(--amber); background: rgba(240, 168, 104, 0.12); }
.book[data-status="lido"] .book__tag { color: var(--teal); background: rgba(88, 209, 201, 0.12); }
.book[data-status="quero-ler"] .book__tag { color: var(--muted); background: rgba(107, 118, 132, 0.12); }

.book__info { min-width: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.book__title { color: var(--text); font-weight: 600; }
.book__author { color: var(--muted); }
.book__author::before { content: " — "; }

.book__remove {
  font-family: var(--mono);
  font-size: 11px;
  color: var(--muted);
  background: transparent;
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 4px 8px;
  cursor: pointer;
  transition: color 0.15s ease, border-color 0.15s ease;
}

.book__remove:hover { color: var(--danger); border-color: var(--danger); }

.empty-state {
  font-size: 13px;
  color: var(--muted);
  text-align: center;
  padding: 28px 12px;
  border: 1px dashed var(--border);
  border-radius: 8px;
  margin-bottom: 8px;
}

.empty-state__bracket { color: var(--amber); }
.hidden { display: none; }

.add-panel {
  margin-top: 24px;
  padding-top: 20px;
  border-top: 1px solid var(--border);
}

.add-panel__label {
  font-size: 13px;
  color: var(--muted);
  margin: 0 0 10px;
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.add-form {
  display: grid;
  grid-template-columns: 1fr 1fr auto auto;
  gap: 8px;
}

.add-form input,
.add-form select {
  font-family: var(--mono);
  font-size: 13px;
  color: var(--text);
  background: var(--bg);
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 9px 10px;
  min-width: 0;
}

.add-form input:focus,
.add-form select:focus {
  outline: none;
  border-color: var(--teal);
}

.add-form__submit {
  font-family: var(--mono);
  font-size: 13px;
  font-weight: 600;
  color: var(--bg);
  background: var(--teal);
  border: 1px solid var(--teal);
  border-radius: 6px;
  padding: 9px 14px;
  cursor: pointer;
  white-space: nowrap;
  transition: filter 0.15s ease;
}

.add-form__submit:hover { filter: brightness(1.1); }

.terminal__footer {
  margin-top: 18px;
  font-size: 11px;
  color: var(--muted);
}

@media (max-width: 560px) {
  .add-form { grid-template-columns: 1fr; }
  .book { grid-template-columns: auto 1fr auto; }
  .book__author { display: block; }
}

@media (prefers-reduced-motion: reduce) {
  .cursor { animation: none; }
  .book { animation: none; }
}
