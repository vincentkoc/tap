class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.3.1/tokenjuice-v0.3.1.tar.gz"
  sha256 "01afc51f9a4badb44e0935a6d9e013db5da87ba902f19bacb97df62905ddc037"
  license "MIT"
  version "0.3.1"

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
    assert_equal "0.3.1", shell_output("#{bin}/tokenjuice --version").strip
  end
end
