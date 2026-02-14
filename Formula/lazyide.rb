class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  url "https://github.com/tgeorge06/lazyide/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "dc09ff1091d9d72686f4ef20d42ac9df5ff0b44be80fb6426d21303ce85e1f0d"
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
