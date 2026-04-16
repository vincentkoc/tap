class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.3.5/tokenjuice-v0.3.5.tar.gz"
  sha256 "e17cd886432258c11dcf7b5511750d0469c30efb519bed5248e3fc91b9a8ebda"
  license "MIT"
  version "0.3.5"

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
    assert_equal "0.3.5", shell_output("#{bin}/tokenjuice --version").strip
  end
end
