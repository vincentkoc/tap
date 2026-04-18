class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.4.0/tokenjuice-v0.4.0.tar.gz"
  sha256 "2a760fa51148f8ca73f988fd6b4ede50efa777b37bd21bab94b32feabd446a94"
  license "MIT"
  version "0.4.0"

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
    assert_equal "0.4.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
