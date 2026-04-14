const isSubPage =   window.location.pathname.includes('/JavaScript/') ||
                    window.location.pathname.includes('/fetch/') ||
                    window.location.pathname.includes('/axios/')||
                    window.location.pathname.includes('/oojs/');
const basePath = isSubPage ? '../' : '';

const headerEsNav = `
<header class="site-header">
    <div class="topbar">Friss, forró, gyors – Pizza King</div>
    <h1>Web programozás-1 Előadás Házi feladat</h1>
    <p class="subtitle">Pizza King rendeléskezelő rendszer</p>
</header>

<nav class="navbar">
    <a href="${basePath}index.html">Főoldal</a>
    <a href="${basePath}JavaScript/javascript.html">JavaScript CRUD</a>
    <a href="${basePath}react.html">React CRUD</a>
    <a href="${basePath}spa.html">SPA</a>
    <a href="${basePath}fetch/fetchapi.html">Fetch API</a>
    <a href="${basePath}axios/axios.html">Axios</a>
    <a href="${basePath}oojs/oojs.html">OOJS</a>
</nav>
`;

const footer = `
<footer class="site-footer">
    Készítette: Baranyi Zsombor (DM372H) és Dancsházi Barnabás (YISAVD)
</footer>
`;

document.addEventListener("DOMContentLoaded", () => {
    document.body.insertAdjacentHTML("afterbegin", headerEsNav);
    document.body.insertAdjacentHTML("beforeend", footer);
});