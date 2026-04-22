class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.6.1/tokenjuice-v0.6.1.tar.gz"
  sha256 "1cf5f0fc25969eba9b8ea380bdee0f28230a10e3e66f88566558c36917fc892e"
  license "MIT"
  version "0.6.1"

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
    assert_equal "0.6.1", shell_output("#{bin}/tokenjuice --version").strip
  end
end
