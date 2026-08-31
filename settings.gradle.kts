pluginManagement {
    repositories {
        gradlePluginPortal()
        mavenCentral()
        google()
    }
}

dependencyResolutionManagement {
    repositories {
        mavenCentral()
        google()
    }
}

rootProject.name = "meine-issuer"
include(":multipaz-openid4vci")
include(":multipaz-openid4vci-server")
