class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.1.0/tokenjuice-v0.1.0.tar.gz"
  sha256 "4e99c49bc1ea7f49445f2344fc958cf24a6b3fb2fbdda0d67b45d99069d39e2e"
  license "MIT"
  version "0.1.0"

  depends_on "node"

  def install
    libexec.install "dist", "package.json", "README.md", "LICENSE"

    (bin/"tokenjuice").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli/main.js" ""
    EOS
    (bin/"tokenjuice").chmod 0755
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
