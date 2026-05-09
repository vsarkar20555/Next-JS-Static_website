export const metadata = {
  title: 'My Next App',
  description: 'Static Next.js App',
}

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
