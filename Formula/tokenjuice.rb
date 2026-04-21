class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.5.1/tokenjuice-v0.5.1.tar.gz"
  sha256 "84f468c79ba9c4dbf82c0f30e92de370654492f19c30265b7ff99b2139abdd66"
  license "MIT"
  version "0.5.1"

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
    assert_equal "0.5.1", shell_output("#{bin}/tokenjuice --version").strip
  end
end
