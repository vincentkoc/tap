class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.6.2/tokenjuice-v0.6.2.tar.gz"
  sha256 "8ae591ace3acb6b66a080fc3ab4ddb5c6a8e0f0a1f024a8b082670692e2fea95"
  license "MIT"
  version "0.6.2"

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
    assert_equal "0.6.2", shell_output("#{bin}/tokenjuice --version").strip
  end
end
