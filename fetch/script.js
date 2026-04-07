document.addEventListener("DOMContentLoaded", () => {
    const apiUrl = "https://jsonplaceholder.typicode.com/posts/1";

    async function fetchData() {
        try {
            const response = await fetch(apiUrl);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            console.log("Fetched data:", data);
        } catch (error) {
            console.error("Fetch failed:", error);
        }
    }

    fetchData();
});