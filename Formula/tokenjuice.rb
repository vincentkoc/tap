class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.6.0/tokenjuice-v0.6.0.tar.gz"
  sha256 "d0bd676461427471fa337229899139f02925baada73f8650f015d0e74ec81aec"
  license "MIT"
  version "0.6.0"

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
    assert_equal "0.6.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
