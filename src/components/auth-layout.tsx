import { SiteHeader } from "@/components/site-header";
import { PageShell } from "@/components/page-shell";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

type AuthLayoutProps = {
  title: string;
  description: string;
  children: React.ReactNode;
};

export function AuthLayout({ title, description, children }: AuthLayoutProps) {
  return (
    <>
      <SiteHeader />
      <main className="flex min-h-[calc(100vh-4rem)] flex-col items-center justify-center">
        <PageShell narrow className="w-full py-10">
          <Card className="border-primary/15">
            <CardHeader>
              <p className="text-xs font-semibold uppercase tracking-widest text-accent">
                Polla Mundial 2026
              </p>
              <CardTitle className="mt-2">{title}</CardTitle>
              <CardDescription>{description}</CardDescription>
            </CardHeader>
            <CardContent>{children}</CardContent>
          </Card>
        </PageShell>
      </main>
    </>
  );
}
