class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.6.5/tokenjuice-v0.6.5.tar.gz"
  sha256 "747e38d9ce67c2fa2e3caec148843b8a8431f448ffb6c903ffb34c565ab4f868"
  license "MIT"
  version "0.6.5"

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
    assert_equal "0.6.5", shell_output("#{bin}/tokenjuice --version").strip
  end
end
