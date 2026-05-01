class Crawlbar < Formula
  desc "macOS menu bar control plane for local-first crawler CLIs"
  homepage "https://github.com/vincentkoc/CrawlBar"
  url "https://github.com/vincentkoc/CrawlBar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3825d0e2497b6bd3eb688fe8eeba26e9875180d988f0954b34ea15c5b0f48e6e"
  license "MIT"
  version "0.1.0"
  head "https://github.com/vincentkoc/CrawlBar.git", branch: "main"

  depends_on macos: :sonoma
  uses_from_macos "swift" => :build

  def install
    system "Scripts/package_app.sh"
    bin.install ".build/release/crawlbarctl" => "crawlbar"
    prefix.install "dist/CrawlBar.app"
    doc.install "README.md", "LICENSE", "CONTRIBUTING.md"
  end

  def caveats
    <<~EOS
      Launch the menu bar app with:
        open #{opt_prefix}/CrawlBar.app

      The CLI is installed as:
        crawlbar
    EOS
  end

  test do
    assert_match "crawlbar commands:", shell_output("#{bin}/crawlbar --help")
  end
end
