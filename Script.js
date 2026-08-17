const STORAGE_KEY = "bookshelf:books";

const seedBooks = [
  { id: crypto.randomUUID(), title: "Duna", author: "Frank Herbert", status: "lido" },
  { id: crypto.randomUUID(), title: "1984", author: "George Orwell", status: "lendo" },
  { id: crypto.randomUUID(), title: "O Guia do Mochileiro das Galáxias", author: "Douglas Adams", status: "quero-ler" },
];

const shelfEl = document.getElementById("shelf");
const emptyStateEl = document.getElementById("empty-state");
const formEl = document.getElementById("book-form");
const countLineEl = document.getElementById("count-line");
const filterButtons = document.querySelectorAll(".filter");

let activeFilter = "todos";

function loadBooks() {
  const raw = localStorage.getItem(STORAGE_KEY);
  if (!raw) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(seedBooks));
    return [...seedBooks];
  }
  try {
    return JSON.parse(raw);
  } catch {
    return [];
  }
}

function saveBooks(books) {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(books));
}

function statusLabel(status) {
  return status.toUpperCase().replace("-", " ");
}

function render() {
  const books = loadBooks();
  const filtered = activeFilter === "todos"
    ? books
    : books.filter((b) => b.status === activeFilter);

  shelfEl.innerHTML = "";

  if (filtered.length === 0) {
    emptyStateEl.classList.remove("hidden");
  } else {
    emptyStateEl.classList.add("hidden");
    filtered.forEach((book) => {
      const article = document.createElement("article");
      article.className = "book";
      article.dataset.status = book.status;
      article.innerHTML = `
        <span class="book__tag">[${statusLabel(book.status)}]</span>
        <span class="book__info"><span class="book__title">${escapeHtml(book.title)}</span><span class="book__author">${escapeHtml(book.author)}</span></span>
        <button class="book__remove" aria-label="remover ${escapeHtml(book.title)}">rm</button>
      `;
      article.querySelector(".book__remove").addEventListener("click", () => removeBook(book.id));
      shelfEl.appendChild(article);
    });
  }

  const total = books.length;
  countLineEl.textContent = `// ${total} livro${total === 1 ? "" : "s"} registrado${total === 1 ? "" : "s"} no total`;
}

function escapeHtml(str) {
  const div = document.createElement("div");
  div.textContent = str;
  return div.innerHTML;
}

function addBook(title, author, status) {
  const books = loadBooks();
  books.unshift({ id: crypto.randomUUID(), title, author, status });
  saveBooks(books);
  render();
}

function removeBook(id) {
  const books = loadBooks().filter((b) => b.id !== id);
  saveBooks(books);
  render();
}

filterButtons.forEach((btn) => {
  btn.addEventListener("click", () => {
    filterButtons.forEach((b) => b.classList.remove("is-active"));
    btn.classList.add("is-active");
    activeFilter = btn.dataset.filter;
    render();
  });
});

formEl.addEventListener("submit", (e) => {
  e.preventDefault();
  const title = document.getElementById("title").value.trim();
  const author = document.getElementById("author").value.trim();
  const status = document.getElementById("status").value;
  if (!title || !author) return;
  addBook(title, author, status);
  formEl.reset();
  document.getElementById("title").focus();
});

render();
