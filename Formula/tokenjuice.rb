class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.6.4/tokenjuice-v0.6.4.tar.gz"
  sha256 "a304306ac10a1e17d787efe32ef5b0037514cf8ad2ec246921410a8b966e1b11"
  license "MIT"
  version "0.6.4"

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
    assert_equal "0.6.4", shell_output("#{bin}/tokenjuice --version").strip
  end
end
