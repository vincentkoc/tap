class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.3.3/tokenjuice-v0.3.3.tar.gz"
  sha256 "7112c4830a0f180fcdceffcc7503f1b1f56564202b576d115b5d3870f08ab65d"
  license "MIT"
  version "0.3.3"

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
    assert_equal "0.3.3", shell_output("#{bin}/tokenjuice --version").strip
  end
end
