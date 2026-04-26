class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.6.3/tokenjuice-v0.6.3.tar.gz"
  sha256 "587f488fbc6eb9d92ed37cb83baa0e7bdf1c520986941101d0ddf8622971ca16"
  license "MIT"
  version "0.6.3"

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
    assert_equal "0.6.3", shell_output("#{bin}/tokenjuice --version").strip
  end
end
