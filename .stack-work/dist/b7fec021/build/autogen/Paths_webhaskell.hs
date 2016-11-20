{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_webhaskell (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\User\\Desktop\\webhaskell\\.stack-work\\install\\e757b539\\bin"
libdir     = "C:\\Users\\User\\Desktop\\webhaskell\\.stack-work\\install\\e757b539\\lib\\x86_64-windows-ghc-8.0.1\\webhaskell-0.1.0.0-G3xyQN2osLiGKWGHxJyv54"
datadir    = "C:\\Users\\User\\Desktop\\webhaskell\\.stack-work\\install\\e757b539\\share\\x86_64-windows-ghc-8.0.1\\webhaskell-0.1.0.0"
libexecdir = "C:\\Users\\User\\Desktop\\webhaskell\\.stack-work\\install\\e757b539\\libexec"
sysconfdir = "C:\\Users\\User\\Desktop\\webhaskell\\.stack-work\\install\\e757b539\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "webhaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "webhaskell_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "webhaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "webhaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "webhaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
