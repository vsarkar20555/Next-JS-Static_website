export async function GET() {
  return Response.json({
    status: "ok",
    version: "v2"
  });
}
