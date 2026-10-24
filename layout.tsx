import Link from "next/link";
import "./globals.css";

export const metadata={title:"SafeAfrica — Prévenez les arnaques en Afrique"};

export default function RootLayout({children}:{children:React.ReactNode}){
 return (<html lang="fr"><body className="min-h-screen bg-slate-50">
 <header className="border-b bg-white"><div className="mx-auto flex max-w-6xl items-center justify-between p-4"><Link href="/" className="text-xl font-bold text-brand-700">SafeAfrica</Link><nav className="flex gap-4 text-sm"><Link href="/arnaques">Catégories</Link><Link href="/arnaques/signalements">Signalements</Link><Link href="/conseils">Conseils</Link><Link href="/admin">Admin</Link></nav><Link href="/signaler" className="rounded-lg bg-brand-600 px-3 py-2 text-white">Signaler</Link></div></header>
 <main className="mx-auto max-w-6xl p-6">{children}</main>
 <footer className="mt-10 border-t bg-white p-6 text-center text-sm text-slate-500">SafeAfrica — Prévenez les arnaques en Afrique.</footer>
 </body></html>);
}