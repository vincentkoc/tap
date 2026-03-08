class Slacrawl < Formula
  desc "Mirror Slack workspace data into local SQLite for fast local search"
  homepage "https://github.com/vincentkoc/slacrawl"
  url "https://github.com/vincentkoc/slacrawl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7423a4668a2cf6c37eaf234bb193abeb51fac85aa68329ab1cb01af696c558ab"
  license "MIT"
  version "0.2.0"

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
