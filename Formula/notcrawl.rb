class Notcrawl < Formula
  desc "Local-first Notion crawler into SQLite and normalized Markdown"
  homepage "https://github.com/vincentkoc/notcrawl"
  url "https://github.com/vincentkoc/notcrawl/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "840df57785c865c26ebd74e5c103e8a0c28a47a9819047af5cdd1b3b1a03036b"
  license "MIT"
  version "0.3.1"

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
