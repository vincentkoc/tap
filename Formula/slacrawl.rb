class Slacrawl < Formula
  desc "Go-based CLI for mirroring Slack workspace data into local SQLite"
  homepage "https://github.com/vincentkoc/slacrawl"
  url "https://github.com/vincentkoc/slacrawl/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "244705e82d3c90755c1b3a5e2967df7b268ebc94f3aa42d15c7071632aba81e8"
  license "MIT"
  version "0.6.0"

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
