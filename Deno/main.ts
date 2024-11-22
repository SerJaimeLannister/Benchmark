function decimalToBinary(num: number): string {
  if (num === 0) return "0";

  const binary: number[] = [];
  const absNum = Math.floor(Math.abs(num));

  let n = absNum;
  while (n > 0) {
    binary.unshift(n % 2);
    n = Math.floor(n / 2);
  }

  return binary.join("");
}

const handler = async (req: Request): Promise<Response> => {
  const url = new URL(req.url);

  // Serve static files
  if (url.pathname === "/") {
    const file = await Deno.readFile("./public/index.html");
    return new Response(file, {
      headers: { "Content-Type": "text/html" },
    });
  }

  if (url.pathname === "/styles.css") {
    const file = await Deno.readFile("./public/styles.css");
    return new Response(file, {
      headers: { "Content-Type": "text/css" },
    });
  }

  // Conversion endpoint
  if (url.pathname === "/convert" && req.method === "POST") {
    const body = await req.text();
    const number = parseInt(body.split("=")[1]);

    if (isNaN(number)) {
      return new Response("Invalid input", { status: 400 });
    }

    return new Response(`Binary: ${decimalToBinary(number)}`);
  }

  return new Response("Not Found", { status: 404 });
};

Deno.serve({ port: 1337 }, handler);
