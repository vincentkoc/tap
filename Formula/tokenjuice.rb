class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.6.4/tokenjuice-v0.6.4.tar.gz"
  sha256 "bf7aa8b53b4f99c237d0e3bb8d5decc87a42dfa644959440f44dc217e6003f2b"
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
