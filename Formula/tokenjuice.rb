class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.5.0/tokenjuice-v0.5.0.tar.gz"
  sha256 "d7c612adb671820ccbcd5577dcab6dfa8d21e25c9fa95b5de20c8697a4b18dd4"
  license "MIT"
  version "0.5.0"

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
    assert_equal "0.5.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
