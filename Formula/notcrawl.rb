class Notcrawl < Formula
  desc "Local-first Notion crawler into SQLite and normalized Markdown"
  homepage "https://github.com/vincentkoc/notcrawl"
  url "https://github.com/vincentkoc/notcrawl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "adf7a356189877a27011044d47b810473d419e7ef43feb590e82ed7a900bdb27"
  license "MIT"
  version "0.2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/notcrawl"
    pkgshare.install "config.example.toml"
    doc.install "README.md", "LICENSE", "SPEC.md"
  end

  test do
    assert_match "Usage of notcrawl:", shell_output("#{bin}/notcrawl --help")
  end
end
