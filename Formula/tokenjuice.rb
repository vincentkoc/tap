class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.8.0/tokenjuice-v0.8.0.tar.gz"
  sha256 "e3ad13aff3fed1a4b521bbbdff5b06265b4e9be2629a4171c6fa4b7eaa46b90e"
  license "MIT"
  version "0.8.0"

  depends_on "node"

  def install
    libexec.install "dist", "package.json", "README.md", "LICENSE"

    (bin/"tokenjuice").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli/main.js" "$@"
    EOS
    (bin/"tokenjuice").chmod 0755
  end

  test do
    assert_equal "0.8.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
