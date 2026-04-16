class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.2.0/tokenjuice-v0.2.0.tar.gz"
  sha256 "953f0e32dd58d4d7318dad487c97bb9e9df2c1d3cfd3a2bd5a5166fcd638a644"
  license "MIT"
  version "0.2.0"

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
    assert_equal "0.2.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
