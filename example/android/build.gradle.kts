allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://falcon-302263071233.d.codeartifact.eu-west-1.amazonaws.com/maven/falconmetrics/")
            credentials {
                username = "aws" // CodeArtifact requires "aws" as username
                password = System.getenv("CODEARTIFACT_AUTH_TOKEN")
            }
        }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
