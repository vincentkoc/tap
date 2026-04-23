class Notcrawl < Formula
  desc "Local-first Notion crawler into SQLite and normalized Markdown"
  homepage "https://github.com/vincentkoc/notcrawl"
  url "https://github.com/vincentkoc/notcrawl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fc5a61d01a1187426c1c44556b6e4e35ac1631535779e8cdaf2862e8b62bd44e"
  license "MIT"
  version "0.1.0"

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
