class Notcrawl < Formula
  desc "Local-first Notion crawler into SQLite and normalized Markdown"
  homepage "https://github.com/vincentkoc/notcrawl"
  url "https://github.com/vincentkoc/notcrawl/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "cb707f02459bcebf35ef065178a35ea89e92ecf6c192008bc0800c191a8c5064"
  license "MIT"
  version "0.3.4"

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
