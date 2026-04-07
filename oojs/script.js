class App {
    constructor(rootSelector = 'body') {
        this.root = document.querySelector(rootSelector);
        this.state = {
            message: 'Object-oriented JS initialized',
            count: 0
        };
    }

    init() {
        if (!this.root) {
            throw new Error('Root element not found');
        }

        this.render();
        this.attachHandlers();
    }

    render() {
        this.root.innerHTML = `
            <div class="app">
                <h1>${this.state.message}</h1>
                <p>Count: <span id="count">${this.state.count}</span></p>
                <button id="increment">Increment</button>
            </div>
        `;
    }

    attachHandlers() {
        const incrementButton = this.root.querySelector('#increment');
        incrementButton.addEventListener('click', () => this.increment());
    }

    increment() {
        this.state.count += 1;
        this.updateCount();
    }

    updateCount() {
        const countEl = this.root.querySelector('#count');
        if (countEl) {
            countEl.textContent = this.state.count;
        }
    }
}

const app = new App('#app');

window.addEventListener('DOMContentLoaded', () => {
    app.init();
});