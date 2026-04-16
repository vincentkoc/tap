class Slacrawl < Formula
  desc "Go-based CLI for mirroring Slack workspace data into local SQLite"
  homepage "https://github.com/vincentkoc/slacrawl"
  url "https://github.com/vincentkoc/slacrawl/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "c30b95a1f388c62d3c5957b69fdd4478cf39148cc9b594bc7d2de1c26f7d5fee"
  license "MIT"
  version "0.3.2"

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
