class Slacrawl < Formula
  desc "Go-based CLI for mirroring Slack workspace data into local SQLite"
  homepage "https://github.com/vincentkoc/slacrawl"
  url "https://github.com/vincentkoc/slacrawl/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "1b803b1656029115669810a1804add00689e35bc5e4e1a1a089eeb5835ef6884"
  license "MIT"
  version "0.3.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/slacrawl"
    pkgshare.install "config.example.toml"
    doc.install "README.md", "LICENSE", "SPEC.md"
  end

  test do
    assert_match "Usage of slacrawl:", shell_output("#{bin}/slacrawl --help", 1)
  end
end
