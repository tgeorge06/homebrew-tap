class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  url "https://github.com/tgeorge06/lazyide/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1ccff3eaa67b657842fe8b92637bdb137bd118af5e0096e29af993f8d5dae5a0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # Install theme files
    (share/"lazyide/themes").install Dir["themes/*.json"]
  end

  def caveats
    <<~EOS
      Theme files have been installed to:
        #{share}/lazyide/themes

      Optional tools for full functionality:
        brew install ripgrep        # project-wide search (Ctrl+Shift+F)
        rustup component add rust-analyzer  # LSP for Rust files
    EOS
  end

  test do
    assert_match "lazyide", shell_output("#{bin}/lazyide --help 2>&1", 1)
  end
end
