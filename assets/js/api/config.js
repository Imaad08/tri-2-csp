export var uri;
if (location.hostname === "localhost") {
        uri = "http://localhost:8086";
} else if (location.hostname === "127.0.0.1") {
        uri = "http://127.0.0.1:8086";
} else {
        uri = "https://flask2.nighthawkcodingsociety.com";
}

export const options = {
    method: 'GET', 
    mode: 'cors', 
    cache: 'default',
    credentials: 'include',
    headers: {
        'Content-Type': 'application/json',
    },
};