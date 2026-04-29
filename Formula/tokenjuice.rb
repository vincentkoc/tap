class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.7.0/tokenjuice-v0.7.0.tar.gz"
  sha256 "65dc33ef04c31ee0f7e135fdcdf6abd28c676ed742ef5426524a4aaa1508ced8"
  license "MIT"
  version "0.7.0"

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
    assert_equal "0.7.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
