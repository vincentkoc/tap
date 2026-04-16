class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.3.0/tokenjuice-v0.3.0.tar.gz"
  sha256 "44ab9f930dbdd1398fc052d175f166516c1fad5c7386104a8c2360db1dcb57f3"
  license "MIT"
  version "0.3.0"

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
    assert_equal "0.3.0", shell_output("#{bin}/tokenjuice --version").strip
  end
end
