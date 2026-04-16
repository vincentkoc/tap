class Tokenjuice < Formula
  desc "Lean output compaction for terminal-heavy agent workflows"
  homepage "https://github.com/vincentkoc/tokenjuice"
  url "https://github.com/vincentkoc/tokenjuice/releases/download/v0.3.4/tokenjuice-v0.3.4.tar.gz"
  sha256 "cd55da0bc73970349cb8ffad8c35fff2c42871ef3fb9e353c57a6f43be1c07c4"
  license "MIT"
  version "0.3.4"

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
    assert_equal "0.3.4", shell_output("#{bin}/tokenjuice --version").strip
  end
end
